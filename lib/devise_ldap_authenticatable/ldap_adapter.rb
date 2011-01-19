require 'net/ldap'

module Devise

  # simple adapter for ldap credential checking
  # ::Devise.ldap_host
  module LdapAdapter

    def self.valid_credentials?(login, password)
      unless ::Devise.active_directory
        login = ::Devise.ldap_login_attribute+'='+login+','+::Devise.ldap_base_dn      
      end
      @encryption = ::Devise.ldap_ssl ? :simple_tls : nil
      ldap = Net::LDAP.new(:encryption => @encryption)
      ldap.host = ::Devise.ldap_host
      ldap.port = ::Devise.ldap_port
      if ::Devise.active_directory
        ldap.authenticate(::Devise.auth_user, ::Devise.auth_password)
        if ldap.bind_as(:base => ::Devise.ldap_base_dn, 
                     :password => password, 
                     :filter => Net::LDAP::Filter.eq('sAMAccountName',login))
          true
        else
          Rails.logger.error "\n##### FAILED LOGIN #####\n#{ldap.get_operation_result.message}\n\n"
          false
        end
      else
        ldap.auth login, password
      
        if ldap.bind
          true
        else
          Rails.logger.error ldap.get_operation_result.message
          false
        end
      end
    end

  end

end
