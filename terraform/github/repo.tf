# GitHub - Création repo

resource "github_repository" "tp_repo" {
  name        = "terraform-lab-repo"
  description = "Repository créé via Terraform"
  visibility  = "private"
  auto_init   = true
}

output "repo_url" {
  value = github_repository.tp_repo.html_url
}
