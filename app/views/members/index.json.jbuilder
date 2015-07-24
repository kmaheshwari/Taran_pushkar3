json.array!(@members) do |member|
  json.extract! member, :id, :name, :dob, :gender, :district, :state, :school_name_or_club_name
  json.url member_url(member, format: :json)
end
