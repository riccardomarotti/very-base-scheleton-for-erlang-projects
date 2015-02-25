require 'rake/clean'

SRC = FileList['src/**/*.erl']
TESTS_SRC = FileList['tests/**/*.erl']
BEAMS = SRC.collect { |file| 'ebin/' + File.basename(file).ext('beam') }
TESTS_BEAMS = TESTS_SRC.collect { |file| 'tests/ebin/' + File.basename(file).ext('beam') }
TESTS_NAMES = FileList['tests/*_tests.erl'].collect { |file| File.basename(file).ext() }

CLEAN.include(FileList['**/*.beam'])
CLEAN.include(FileList['**/*.dump'])
CLEAN.include(FileList['**/ebin'])

directory 'ebin'
directory 'tests/ebin'

rule(/tests\/.*\.beam$/ => lambda {|beam| beam.gsub('.beam', '.erl').gsub('ebin/', '') }) do |t|
  sh "erlc -o tests/ebin #{t.source}"
end

rule /ebin\/.*\.beam$/ => '%{ebin,src}X.erl' do |t|
  sh "erlc -o ebin #{t.source}"
end

task :default => [:compile]

desc 'Update loaded module: to use in the repl, to reload recompiled modules.'
task :update_modules_list do
	MODULES = SRC.collect { |file| File.basename(file).ext('') }
	File.open('modules', 'w') do |file|
		file.print '['
		modules = ''
		MODULES.each do |module_name|
			modules = modules + "#{module_name},"
		end
		file.print modules[0...-1]
		file.print '].'
	end
end


desc 'Compiles project'
task :compile => [:update_modules_list, 'ebin'] + BEAMS

desc 'Lanches tests'
task :test => ['tests/ebin', :compile] + TESTS_BEAMS do
	test_command = "erl -pa ./tests/ebin ./ebin -noshell"
	TESTS_NAMES.each do |mod|
		test_command = "#{test_command} -s eunit test #{mod}"
	end
 	test_command = "#{test_command} -s init stop"

	sh test_command
end

task :atest, [:module_name] => ['tests/ebin', :compile] + TESTS_BEAMS do |t, args|
	sh "erl -pa ./tests/ebin ./ebin -noshell -s eunit test #{args[:module_name]} -s init stop"
end

task :run => :compile do
#    sh "erl -noshell -s module function 25"
end

desc 'opens Erlang\'s REPL, after compiling'
task :shell => :compile do
	sh 'erl -pa ebin'
end
