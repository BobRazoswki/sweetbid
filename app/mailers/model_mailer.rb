

def new_record_notification(record)
  @record = record
  mail to:      "contact@sweetbid.fr", 
  	   subject: "Success! You did it."
end