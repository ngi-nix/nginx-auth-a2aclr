{
  description = "NGINX Arpa2 Authentication Module";

  outputs = { ... }: {
    overlay = final: prev: {
      nginxModules = prev.nginxModules // {
        auth-a2aclr = {
          src = prev.fetchFromGitLab {
            name = "auth-a2aclr";
            owner = "arpa2";
            repo = "nginx-auth-a2aclr";
            rev = "bbabf9480bb2b40ac581551883a18dfa6522dd63";
            sha256 = "sha256-h2LgMhreCgod+H/bNQzY9BvqG9ezkwikwWB3T6gHH04=";
          };

          inputs = [
            (prev.arpa2common.overrideAttrs (old: rec {
              version = "0.7.1";

              src = prev.fetchFromGitLab {
                owner = "arpa2";
                repo = "arpa2common";
                rev = "v${version}";
                sha256 = "sha256-8zVsAlGtmya9EK4OkGUMu2FKJRn2Q3bg2QWGjqcii64=";
              };
            }))
          ];
        };
      };
    };
  };
}
