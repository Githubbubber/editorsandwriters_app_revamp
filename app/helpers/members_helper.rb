module MembersHelper
	
	# Returns the Gravatar for the given member.
	def gravatar_for(member, size: 80)
		gravatar_id = Digest::MD5::hexdigest(member.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: member.alter_ego, class: "gravatar")
	end
end
