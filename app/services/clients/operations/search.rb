module Clients
    module Operations
        class Search
            attr_reader :query

            def initialize(query)
              @query = query
            end
            
            def clients
                return all_clients if query.blank?
                return [] if filtered_clients.blank?

                filtered_clients
            end
            
            private

            def filtered_clients
                @filtered_clients ||= search_by_name + search_by_kind + search_by_design
            end

            def all_clients
                Client.all
            end

            def search_by_name 
                Client.where("lower(name) LIKE ?", "%#{query.downcase}%")
            end
            
            def search_by_kind
                Client.where("lower(kind) LIKE ?", "%#{query.downcase}%")
            end

            def search_by_design
                Client.where("lower(designed_by) LIKE ?", "%#{query.downcase}%")
            end
        end
    end
end