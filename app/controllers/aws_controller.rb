class AwsController < ApplicationController

  def index
    objects = AWS.list_objects(bucket: BUCKET, delimiter: '/');
    set_contents_and_directories(objects)
  end

  def subdirectory
    prefix = params[:prefix] + '/'
    objects = AWS.list_objects(bucket: BUCKET, prefix: prefix,  delimiter: '/');
    set_contents_and_directories(objects)
  end

  private

  def set_contents_and_directories(objects)
    @contents = set_contents(objects)
    @directories = set_directories(objects)
  end

  def set_contents(objects)
    objects.contents.map(&:key)
  end

  def set_directories(objects)
    objects.common_prefixes.map(&:prefix)
  end

end
