require 'logger'
require 'net/http'

# Credits go to John Nunemaker for the heart of this code - railstips.org

class RedirectFollower
	class TooManyRedirects < StandardError; end

	attr_accessor :url, :body, :redirect_limit, :response

	def initialize(url, limit=5)
		@url, @redirect_limit = url, limit
		#logger.level = Logger::INFO
	end

	def logger
		@logger ||= Logger.new("logger.log")
	end

	def resolve
		raise TooManyRedirects if redirect_limit < 0

    # what if URI.parse raise an URI::InvalidURIError?
		self.response = Net::HTTP.get_response(URI.parse(url))

		#logger.info "redirect limit: #{redirect_limit}"
		#logger.info "response code: #{response.code}"
		#logger.info "response body: #{response.body}"

		if response.kind_of?(Net::HTTPRedirection)
			self.url = redirect_url
			self.redirect_limit -= 1

			#logger.info "redirect found, headed to #{url}"
			resolve
		end

		#self.body = response.body
		#self
		
		self.url
	end

	def redirect_url
		#if response['location'].nil?
		# Commented out, because it is unclear what this is looking for
		# The first link in the returned body? Is it certain that is a redirect?
		#	response.body.match(/<a href=\"([^>]+)\">/i)[1]
		#else
		response['location']
		#end
	end
end









