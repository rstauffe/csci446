atom_feed do |feed|
	feed.title "Fosters"
	feed.updated @latest_foster.try(:updated_at)
	
	FosterParent.all.each do |foster|
		feed.entry(foster) do |entry|
			entry.title "Foster #{foster.id}"
			entry.summary type: 'xhtml' do |xhtml|
				xhtml.p "Located at #{foster.address}"
				xhtml.p "Pet id: #{foster.pet_id}"
			end
			entry.author do |author|
				author.name foster.name
				author.email foster.email
			end
		end
	end
end