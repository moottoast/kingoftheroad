module Route53
  def Route53.client(credential)
    Aws::Route53::Client.new(
      region: 'us-east-1',
      access_key_id: "#{credential.access_key_id}",
      secret_access_key: "#{credential.secret_access_key}"
    )
  end

  def Route53.hosted_zones(credential)
    Route53.client(credential).list_hosted_zones.hosted_zones
  end

  def Route53.get_hosted_zone_id(name, credential)
    id = false
    Route53.hosted_zones(credential).each do |hosted_zone|
      if name == hosted_zone.name
        id =  hosted_zone.id.split('/')[-1]
      end
    end
    id
  end

  def Route53.change_record(credential, id, host, type, ttl, value)
    Route53.client(credential).change_resource_record_sets({
      change_batch: {
        changes: [
          {
            action: "UPSERT",
            resource_record_set: {
              name: "#{host}",
              resource_records: [
                {
                  value: "#{value}"
                },
              ],
              ttl: "#{ttl}",
              type: "#{type}"
            },
          },
        ],
        comment: '',
      },
      hosted_zone_id: "#{id}"
    })
  end
end
