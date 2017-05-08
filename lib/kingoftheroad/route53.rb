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
        id =  hosted_zone.id
      end
    end
    id
  end
end
