cask "s3-workbench" do
  version "0.7.0"
  sha256 "46c2e2bf2ef6f37e57562103a6d9c1d1eb812d584e8d3617bdaf4e976d651a48"

  url "https://github.com/romainfrezier/S3Workbench/releases/download/v#{version}/S3Workbench-#{version}.dmg"
  name "S3Workbench"
  desc "Native browser for S3-compatible object storage"
  homepage "https://github.com/romainfrezier/S3Workbench"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "S3Workbench.app"
end
