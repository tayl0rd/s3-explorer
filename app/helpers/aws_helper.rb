module AwsHelper

  def signed_url(prefix,key)
    SIGNER.presigned_url(:get_object, bucket: BUCKET, key: prefix + key)
  end

  def title
    params[:prefix] + '/'
  end

  def name(dir)
    dir.split('/').last + '/'
  end

  def up_directory
    up = get_up_directory
    if up 
      link_to up, directory_path(up)
    else
      link_to 'root', patients_path
    end
  end

  private

  def get_up_directory
    path = params[:prefix].split('/')
    path[0...-1].join('/') + '/' if path.length > 1
  end

end
