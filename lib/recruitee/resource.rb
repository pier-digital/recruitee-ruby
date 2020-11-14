# frozen_string_literal: true

module Recruitee
  class Resource
    attr_reader :properties

    def initialize(client, properties)
      @client = client
      @properties = deep_symbolize_keys(properties)
    end

    def [](key)
      @properties[key.to_sym]
    end

    def []=(key, value)
      send(:"#{key}=", value)
    end

    def method_missing(name, *args)
      if name.to_s.end_with?('=')
        attr = name.to_s[0...-1].to_sym
        @properties[attr] = args.first
      elsif @properties.key?(name)
        @properties[name]
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      attr = name.to_s.end_with?('=') ? name.to_s[0...-1].to_sym : name
      @properties.key?(attr) || super
    end

    def to_s
      values = @properties.map { |k, v| "#{k}: #{v}" }.join(' ')
      "<#{self.class.name} #{values}>"
    end

    private

    attr_reader :client

    def deep_symbolize_keys(object)
      deep_transform_keys(object) do |key|
        begin
          key.to_sym
        rescue StandardError
          key
        end
      end
    end

    def deep_transform_keys(object, &block)
      case object
      when Hash
        object.each_with_object({}) do |(key, value), result|
          result[yield(key)] = deep_transform_keys(value, &block)
        end
      when Array
        object.map { |e| deep_transform_keys(e, &block) }
      else
        object
      end
    end
  end
end
