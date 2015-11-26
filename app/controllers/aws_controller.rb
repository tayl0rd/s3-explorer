class AwsController < ApplicationController

  def index
    objects = AWS.list_objects(bucket: BUCKET, delimiter: '/');
    set_contents_and_directories(objects)
  end

  def subdirectory
    prefix = params[:prefix] + '/'
    objects = AWS.list_objects(bucket: BUCKET, prefix: prefix,  delimiter: '/');
    set_contents_and_directories(objects)
    @contents = strip_slash_from_contents
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

  def strip_slash_from_contents
    if @contents
      @contents.map do |object|
        object.split('/').last
      end
    end
  end

end
