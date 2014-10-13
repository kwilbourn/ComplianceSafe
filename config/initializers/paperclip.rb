module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
end