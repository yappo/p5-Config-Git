use inc::Module::Install;
name 'Config-Git';
all_from 'lib/Config/Git.pm';
readme_from 'lib/Config/Git.pm';
readme_markdown_from 'lib/Config/Git.pm';
githubmeta;

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
