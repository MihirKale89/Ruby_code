class LRUCache

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @hash = {}
        @capacity = capacity
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        return -1 if !@hash.key?(key)
        value = @hash.delete(key)
        @hash[key] = value
        value
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        if !@hash.key?(key)
            @hash[key] = value
            @hash.shift if @hash.length > @capacity
        else
            @hash.delete(key)
            @hash[key] = value
        end
    end


end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
