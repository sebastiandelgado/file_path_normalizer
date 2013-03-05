

def normalize(filePath)

	fp = filePath

	# remove relevant '.'
	while fp =~ /\/\.\/|\A\.\/|\/\.\z/
		fp = fp.gsub(/\/\.\/|\A\.\/|\/\.\z/, "/") 
	end

	# remove relevant '..' and their parent directories if any
	while fp =~ /\A\.\.\/|\/\.\.\/|\/\.\.\z/ 
		#  MATCH: ('/' or beginning of string) + (any text uninterrupted by '/' that is not only '..') 
		#  + ('/..') + ('/' or end of string)
		fp = fp.gsub(/(\/|\A)([^\/]*|[^\.\/].[^\.\/].)\/\.\.(\/|\z)/, "/")
		# remove '..' referring to inexistent parent directory
		fp = fp.gsub(/\A\/?\.\.\//, "")
	end

	fp = fp.gsub(/\A\/|\/\z/, "")

	return fp
end

$stdout.print normalize(STDIN.gets)
