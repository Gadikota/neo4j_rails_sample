json.locations @locations.map{|l| [l.latitude, l.longitude] if l.latitude.present? && l.longitude.present?}.compact