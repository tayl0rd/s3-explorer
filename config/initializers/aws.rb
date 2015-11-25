AWS = Aws::S3::Client.new
SIGNER = Aws::S3::Presigner.new
BUCKET = ENV['S3_BUCKET']

