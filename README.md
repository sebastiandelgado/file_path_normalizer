file_path_normalizer
====================

Normalizes file path strings. file_path_norm.rb reads the string from standard input and prints it to standard out.

Normalizing means:
* all single dot components of the path must be removed.  For example, "foo/./bar" should be normalized to "foo/bar".
* all double dots components of the path must be removed, along with their parent directory, if any.  For example, "foo/bar/../baz" should be normalized to "foo/baz".

NOTE:

To run the tests in file_path_norm_test.rb it is necessary to remove the '$stdout.print normalize(STDIN.gets)' statement from file_path_norm.rb

