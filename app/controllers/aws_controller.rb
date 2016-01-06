class AwsController < ApplicationController

  def index
    objects = AWS.list_objects(bucket: BUCKET, delimiter: '/');
    set_contents_and_directories(objects)
  end

  def subdirectory
    prefix = params[:prefix] + '/'
    objects = AWS.list_objects(bucket: BUCKET, prefix: prefix,  delimiter: '/');
    keys  = get_keys(objects)
    if keys.first == prefix
      @contents = []
    else
      @contents = set_contents(keys)
    end
    @directories = set_directories(objects)
  end

  private

  def get_keys(objects)
    objects.contents.map(&:key)
  end

  def set_contents_and_directories(objects)
    keys = get_keys(objects)
    @contents = set_contents(keys)
    @directories = set_directories(objects)
  end

  def set_contents(keys)
    keys.map do |key|
      key.split('/').last
    end
  end

  def set_directories(objects)
    objects.common_prefixes.map(&:prefix)
  end

end
