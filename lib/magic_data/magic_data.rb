# encoding: utf-8

class MagicData

  @magic={}
  @saved={}

  class << self

    def process(fields)
      modified = {}
      fields.each do |key, value|
        @saved["latest_#{value}"]= modified[key] = @magic[value].call if @magic.key?(value)
        modified[key] = @saved[value] if @saved.key?(value)
      end
      MagicLogger.log('magic_data_modified', modified)
      fields.merge(modified)
    end

    def set(key, value = nil, &block)
      @magic[key] = block_given? ?  block : lambda { "#{value}" }
    end

    def get(key)
      @saved["latest_#{key}"]= @magic[key].call
      MagicLogger.log('magic_data_generated', @saved["latest_#{key}"])
      @saved["latest_#{key}"]
    end

    def get_latest(key)
      @saved["latest_#{key}"]
      MagicLogger.log('magic_data_retrieved', @saved["latest_#{key}"])
      @saved["latest_#{key}"]
    end

  end
end


