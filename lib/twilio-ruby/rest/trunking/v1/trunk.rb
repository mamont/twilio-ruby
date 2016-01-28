##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Trunking < Domain
      class V1 < Version
        class TrunkList < ListResource
          ##
          # Initialize the TrunkList
          # @param [Version] version Version that contains the resource
          
          # @return [TrunkList] TrunkList
          def initialize(version)
            super(version)
            
            # Path Solution
            @solution = {}
            @uri = "/Trunks"
          end
          
          ##
          # Retrieve a single page of TrunkInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The friendly_name
          # @param [String] domain_name The domain_name
          # @param [String] disaster_recovery_url The disaster_recovery_url
          # @param [String] disaster_recovery_method The disaster_recovery_method
          # @param [String] recording The recording
          # @param [Boolean] secure The secure
          
          # @return [TrunkInstance] Newly created TrunkInstance
          def create(friendly_name: nil, domain_name: nil, disaster_recovery_url: nil, disaster_recovery_method: nil, recording: nil, secure: nil)
            data = {
                'FriendlyName' => friendly_name,
                'DomainName' => domain_name,
                'DisasterRecoveryUrl' => disaster_recovery_url,
                'DisasterRecoveryMethod' => disaster_recovery_method,
                'Recording' => recording,
                'Secure' => secure,
            }
            
            payload = @version.create(
                'POST',
                @uri,
                data: data
            )
            
            return TrunkInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Lists TrunkInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(
                limit: limit,
                page_size: page_size
            ).entries
          end
          
          ##
          # Streams TrunkInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)
            
            page = self.page(
                page_size: limits['page_size'],
            )
            
            @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
          end
          
          ##
          # When passed a block, yields TrunkInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to read the
          #                       limit with the most efficient page size, i.e. min(limit, 1000)
          def each
            limits = @version.read_limits
            
            page = self.page(
                page_size: limits['page_size'],
            )
            
            @version.stream(page,
                            limit: limits['limit'],
                            page_limit: limits['page_limit']).each {|x| yield x}
          end
          
          ##
          # Retrieve a single page of TrunkInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          
          # @return [Page] Page of TrunkInstance
          def page(page_token: nil, page_number: nil, page_size: nil)
            params = {
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            }
            response = @version.page(
                'GET',
                @uri,
                params
            )
            return TrunkPage.new(@version, response, @solution)
          end
          
          ##
          # Constructs a TrunkContext
          # @param [String] sid The sid
          
          # @return [TrunkContext] TrunkContext
          def get(sid)
            TrunkContext.new(
                @version,
                sid: sid,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Trunking.V1.TrunkList>'
          end
        end
      
        class TrunkPage < Page
          ##
          # Initialize the TrunkPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          
          # @return [TrunkPage] TrunkPage
          def initialize(version, response, solution)
            super(version, response)
            
            # Path Solution
            @solution = solution
          end
          
          ##
          # Build an instance of TrunkInstance
          # @param [Hash] payload Payload response from the API
          
          # @return [TrunkInstance] TrunkInstance
          def get_instance(payload)
            return TrunkInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Trunking.V1.TrunkPage>'
          end
        end
      
        class TrunkContext < InstanceContext
          ##
          # Initialize the TrunkContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          
          # @return [TrunkContext] TrunkContext
          def initialize(version, sid)
            super(version)
            
            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Trunks/#{@solution[:sid]}"
            
            # Dependents
            @origination_urls = nil
            @credentials_lists = nil
            @ip_access_control_lists = nil
            @phone_numbers = nil
          end
          
          ##
          # Fetch a TrunkInstance
          # @return [TrunkInstance] Fetched TrunkInstance
          def fetch
            params = {}
            
            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )
            
            return TrunkInstance.new(
                @version,
                payload,
                sid: @solution['sid'],
            )
          end
          
          ##
          # Deletes the TrunkInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            return @version.delete('delete', @uri)
          end
          
          ##
          # Update the TrunkInstance
          # @param [String] friendly_name The friendly_name
          # @param [String] domain_name The domain_name
          # @param [String] disaster_recovery_url The disaster_recovery_url
          # @param [String] disaster_recovery_method The disaster_recovery_method
          # @param [String] recording The recording
          # @param [Boolean] secure The secure
          
          # @return [TrunkInstance] Updated TrunkInstance
          def update(friendly_name: nil, domain_name: nil, disaster_recovery_url: nil, disaster_recovery_method: nil, recording: nil, secure: nil)
            data = {
                'FriendlyName' => friendly_name,
                'DomainName' => domain_name,
                'DisasterRecoveryUrl' => disaster_recovery_url,
                'DisasterRecoveryMethod' => disaster_recovery_method,
                'Recording' => recording,
                'Secure' => secure,
            }
            
            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )
            
            return TrunkInstance.new(
                @version,
                payload,
                sid: @solution['sid'],
            )
          end
          
          ##
          # Access the origination_urls
          # @return [OriginationUrlList] OriginationUrlList
          def origination_urls(sid=:unset)
            if sid != :unset
              return OriginationUrlContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @origination_urls
              @origination_urls = OriginationUrlList.new(
                  @version,
                  trunk_sid: @solution[:sid],
              )
            end
            
            @origination_urls
          end
          
          ##
          # Access the credentials_lists
          # @return [CredentialListList] CredentialListList
          def credentials_lists(sid=:unset)
            if sid != :unset
              return CredentialListContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @credentials_lists
              @credentials_lists = CredentialListList.new(
                  @version,
                  trunk_sid: @solution[:sid],
              )
            end
            
            @credentials_lists
          end
          
          ##
          # Access the ip_access_control_lists
          # @return [IpAccessControlListList] IpAccessControlListList
          def ip_access_control_lists(sid=:unset)
            if sid != :unset
              return IpAccessControlListContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @ip_access_control_lists
              @ip_access_control_lists = IpAccessControlListList.new(
                  @version,
                  trunk_sid: @solution[:sid],
              )
            end
            
            @ip_access_control_lists
          end
          
          ##
          # Access the phone_numbers
          # @return [PhoneNumberList] PhoneNumberList
          def phone_numbers(sid=:unset)
            if sid != :unset
              return PhoneNumberContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @phone_numbers
              @phone_numbers = PhoneNumberList.new(
                  @version,
                  trunk_sid: @solution[:sid],
              )
            end
            
            @phone_numbers
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Trunking.V1.TrunkContext #{context}>"
          end
        end
      
        class TrunkInstance < InstanceResource
          ##
          # Initialize the TrunkInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          
          # @return [TrunkInstance] TrunkInstance
          def initialize(version, payload, sid: nil)
            super(version)
            
            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'domain_name' => payload['domain_name'],
                'disaster_recovery_method' => payload['disaster_recovery_method'],
                'disaster_recovery_url' => payload['disaster_recovery_url'],
                'friendly_name' => payload['friendly_name'],
                'secure' => payload['secure'],
                'recording' => payload['recording'],
                'auth_type' => payload['auth_type'],
                'auth_type_set' => payload['auth_type_set'],
                'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                'sid' => payload['sid'],
                'url' => payload['url'],
                'links' => payload['links'],
            }
            
            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end
          
          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          
          # @return [TrunkContext] TrunkContext for this TrunkInstance
          def context
            unless @instance_context
              @instance_context = TrunkContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end
          
          def account_sid
            @properties['account_sid']
          end
          
          def domain_name
            @properties['domain_name']
          end
          
          def disaster_recovery_method
            @properties['disaster_recovery_method']
          end
          
          def disaster_recovery_url
            @properties['disaster_recovery_url']
          end
          
          def friendly_name
            @properties['friendly_name']
          end
          
          def secure
            @properties['secure']
          end
          
          def recording
            @properties['recording']
          end
          
          def auth_type
            @properties['auth_type']
          end
          
          def auth_type_set
            @properties['auth_type_set']
          end
          
          def date_created
            @properties['date_created']
          end
          
          def date_updated
            @properties['date_updated']
          end
          
          def sid
            @properties['sid']
          end
          
          def url
            @properties['url']
          end
          
          def links
            @properties['links']
          end
          
          ##
          # Fetch a TrunkInstance
          # @return [TrunkInstance] Fetched TrunkInstance
          def fetch
            @context.fetch()
          end
          
          ##
          # Deletes the TrunkInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @context.delete()
          end
          
          ##
          # Update the TrunkInstance
          # @param [String] friendly_name The friendly_name
          # @param [String] domain_name The domain_name
          # @param [String] disaster_recovery_url The disaster_recovery_url
          # @param [String] disaster_recovery_method The disaster_recovery_method
          # @param [String] recording The recording
          # @param [Boolean] secure The secure
          
          # @return [TrunkInstance] Updated TrunkInstance
          def update(friendly_name: nil, domain_name: nil, disaster_recovery_url: nil, disaster_recovery_method: nil, recording: nil, secure: nil)
            @context.update(
                domain_name: nil,
                disaster_recovery_url: nil,
                disaster_recovery_method: nil,
                recording: nil,
                secure: nil,
            )
          end
          
          ##
          # Access the origination_urls
          # @return [origination_urls] origination_urls
          def origination_urls
            @context.origination_urls
          end
          
          ##
          # Access the credentials_lists
          # @return [credentials_lists] credentials_lists
          def credentials_lists
            @context.credentials_lists
          end
          
          ##
          # Access the ip_access_control_lists
          # @return [ip_access_control_lists] ip_access_control_lists
          def ip_access_control_lists
            @context.ip_access_control_lists
          end
          
          ##
          # Access the phone_numbers
          # @return [phone_numbers] phone_numbers
          def phone_numbers
            @context.phone_numbers
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Trunking.V1.TrunkInstance #{context}>"
          end
        end
      end
    end
  end
end