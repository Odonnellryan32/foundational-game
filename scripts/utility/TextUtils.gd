# Collection of static functions for interacting with text


# Remove characters from String that match the given regex
# Clamp string size to max_length
static func sanitize_input(
	regex: RegEx, text: String, replace: String = "", max_length: int = -1):
	return regex.sub(text, "", true).substr(0, max_length)
