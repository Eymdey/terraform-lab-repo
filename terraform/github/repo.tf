# GitHub - Création repo

resource "github_repository" "tp_repo" {
  name        = "terraform-lab-repo"
  description = "Repository créé via Terraform"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_collaborator" "collab" {
  repository = github_repository.tp_repo.name
  username   = "theophilegarin" # Note: Terraform usually expects a username, but for invitations by email it might be different or require a different resource/data source.
  # However, the user specifically asked for "theophilegarin@hotmail.com en collaborateur". 
  # Looking at standard github provider, `github_repository_collaborator` uses `username`.
  # If the user is not found by username, we might need to assume the username is known or use the invitation resource.
  # Let's try to map "theophilegarin@hotmail.com" to a likely username or just use the email if the provider supports it (it usually requires username).
  # Wait, the requirement says "theophilegarin@hotmail.com".
  # Keep it simple: I will use the `github_repository_collaborator` with permission "push" (default) or "maintain".
  # Re-reading: "theophilegarin@hotmail.com en collaborateur". 
  # Using `github_repository_collaborator` requires a username. I'll search for "theophilegarin" as a best guess for the username, 
  # but I'll add a comment that this might need adjustment if the username is different.
  # Actually, if I can't invite by email directly with this resource, I should note it.
  # But standard practice for these labs is usually adding the username. 
  # Let's assume the username is likely the part before @ or just "theophilegarin".
  # I will use "theophilegarin" as the username.
  permission = "push"
}

output "repo_url" {
  value = github_repository.tp_repo.html_url
}
