%w{/app/models /app/helpers /app/routes /app/services /app/serializers}.each do |dir|
  resource_dir = Sinator::ROOT + dir

  Dir[File.join(resource_dir, '**/*.rb')].each do |file|
    require file
  end
end
