local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.4diac', 'eclipse-4diac') {
  settings+: {
    description: "",
    name: "Eclipse 4diac™",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('GITLAB_API_TOKEN') {
      value: "pass:bots/iot.4diac/gitlab.eclipse.org/api-token",
    },
  ],
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/4diac/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('4diac-documentation') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      has_discussions: true,
    },
    orgs.newRepo('4diac-examples') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('4diac-fbe') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "release",
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      description: "Build and cross-compilation environment for 4diac FORTE.",
      homepage: "https://eclipse.dev/4diac/4diac_fbe/",
      topics+:[
       "4diac",
       "4diac-forte",
       "build-system",
       "cross-compilation",
       "distributed-automation",
       "eclipse-4diac",
       "embedded-systems",
       "iec-61499",
       "industrial-automation",
       "runtime",
      ]
    },
    orgs.newRepo('4diac-forte') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "release",
      delete_branch_on_merge: false,
      description: "4diac FORTE is a small portable implementation of an IEC 61499 runtime environment targeting small embedded control devices, implemented in C++.",
      has_discussions: true,
      homepage: "https://eclipse.dev/4diac/4diac_forte/",
      web_commit_signoff_required: false,
      code_scanning_default_setup_enabled: true,
      topics+: [
        "iec-61499",
        "plc",
        "real-time",
        "real-time-systems",
      ],
    },
    orgs.newRepo('4diac-fortebuildcontainer') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('4diac-ide') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "develop",
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      code_scanning_default_setup_enabled: true,
      description: "Eclipse 4diac IDE – an open-source engineering tool for IEC 61499-based distributed automation systems.",
      homepage: "https://eclipse.dev/4diac/4diac_ide/",
      topics+: [
       "4diac",
       "eclipse",
       "function-block",
       "function-block-diagram",
       "iec-61131-3",
       "iec-61499",
       "iec61131-3",
       "iec61499",
       "industrial-automation",
       "industrial-control",
       "industrial-control-system",
       "plc",
       "plc-programming",
      ]
    },
    orgs.newRepo('4diac-toolchain') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "release",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('4diac-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('4diac-website-hugo') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
