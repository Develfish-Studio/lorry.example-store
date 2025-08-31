--!strict

local UploadS3 = require('@lorry.project-vue/lib/Control/UploadS3')

local requests = require('./requests')

local uploads = {}

uploads.upload_guide_attachment = UploadS3
  :from_request(requests.request_presign_upload, 'guide_attachment')
  :with_bucket('app-public-document')
  :with_directory('guides')

return uploads
