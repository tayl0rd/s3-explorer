module AwsHelper

  def signed_url(key)
    SIGNER.presigned_url(:get_object, bucket: BUCKET, key: key)
  end

end
