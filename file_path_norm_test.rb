require "./file_path_norm"
require "test/unit"

# NOTE: To run these tests it is necessary to comment out the $stdout.print statement in file_path_norm.rb

class TestFilePaths < Test::Unit::TestCase
 
  def test_simple

	# stuff that shouldn't change

	assert_equal("foo/bar", normalize("foo/bar"))
	assert_equal("foo//bar", normalize("foo//bar"))

	# single dot

	assert_equal("foo/bar/baz", normalize("foo/bar/./baz"))
	assert_equal("foo/bar", normalize("./foo/bar"))
	assert_equal("foo/bar", normalize("/foo/bar/."))
	assert_equal("foo/bar", normalize("foo/./././bar"))
	assert_equal("foo/b.ar", normalize("/foo/b.ar"))
	assert_equal("foo/.bar", normalize("/foo/.bar"))
	assert_equal("foo/bar", normalize("foo/bar/./"))
	assert_equal("foo/bar", normalize("/./foo/bar"))

	# double dot

	assert_equal("foo/baz", normalize("foo/bar/../baz"))
	assert_equal("baz", normalize("foo/bar/../../baz"))
	assert_equal("foo", normalize("/foo/baz/../"))
	assert_equal("", normalize("/foo/baz/../../"))
	assert_equal("", normalize("baz/.."))
	assert_equal("", normalize("/baz/.."))
	assert_equal("foo", normalize("baz/../foo"))
	assert_equal("foo", normalize("/baz/../foo"))
	assert_equal("foo", normalize("/baz..boz/../foo"))
	assert_equal("foo..yoo", normalize("/baz..boz/../foo..yoo"))
	assert_equal("baz..foo", normalize("baz..foo/hum/.."))

	# normalizing with no parent

	assert_equal("baz", normalize("../baz"))
	assert_equal("baz", normalize("/../baz"))
	assert_equal("", normalize("/../baz/../"))
	assert_equal("", normalize("/../baz/.."))
	assert_equal("foo/baz", normalize("../../../foo/baz"))
	assert_equal("", normalize("../../../foo/baz/../../"))

	# other
	assert_equal("foo/bar", normalize("foo/bar/"))
	assert_equal("foo/bar", normalize("/foo/bar"))
	assert_equal("foo/bar", normalize("/foo/bar/"))

  end
 
end
