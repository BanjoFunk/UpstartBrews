json.id comment.id
json.created_at comment.created_at.strftime("%m/%d/%Y at %I:%M %p").downcase
json.user comment.user.email
json.text comment.text