class AwsController < ApplicationController
  def index
    objects = AWS.list_objects(bucket: 'coulter-api-dev', delimiter: '/');
    @contents = objects.contents.map(&:key)
    @directories = objects.common_prefixes.map(&:prefix)
  end

  def subdirectory
    prefix = params[:prefix] + '/'
    objects = AWS.list_objects(bucket: 'coulter-api-dev', prefix: prefix,  delimiter: '/');
    @contents = objects.contents.map(&:key)
    @directories = objects.common_prefixes.map(&:prefix)
  end
end
