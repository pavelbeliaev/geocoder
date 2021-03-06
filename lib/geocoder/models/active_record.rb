require 'geocoder/models/base'

module Geocoder
  module Model
    module ActiveRecord
      include Base

      ##
      # Set attribute names and include the Geocoder module.
      #
      def geocoded_by(options = {}, &block)
        geocoder_init(
          :geocode       => true,
          :prefixes      => options[:prefixes]  || [''],
          :address       => options[:address]   || :address,
          :latitude      => options[:latitude]  || :latitude,
          :longitude     => options[:longitude] || :longitude,
          :geocode_block => block,
          :units         => options[:units],
          :method        => options[:method],
          :lookup        => options[:lookup],
          :language      => options[:language]
        )
      end

      ##
      # Set attribute names and include the Geocoder module.
      #
      def reverse_geocoded_by(latitude_attr, longitude_attr, options = {}, &block)
        geocoder_init(
          :reverse_geocode => true,
          :prefixes      => options[:prefixes]  || [''],
          :fetched_address => options[:address] || :address,
          :latitude        => latitude_attr,
          :longitude       => longitude_attr,
          :reverse_block   => block,
          :units           => options[:units],
          :method          => options[:method],
          :lookup          => options[:lookup],
          :language        => options[:language]
        )
      end


      private # --------------------------------------------------------------

      def geocoder_file_name;   "active_record"; end
      def geocoder_module_name; "ActiveRecord"; end
    end
  end
end

