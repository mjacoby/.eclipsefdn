local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('dt.fa3st', 'eclipse-fa3st') {
  settings+: {
    description: "",
    name: "Fa3st Project",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('GPG_KEY_ID') {
      value: "pass:bots/dt.fa3st/gpg/key_id",
    },
    orgs.newOrgSecret('GPG_PASSPHRASE') {
      value: "pass:bots/dt.fa3st/gpg/passphrase",
    },
    orgs.newOrgSecret('GPG_PRIVATE_KEY') {
      value: "pass:bots/dt.fa3st/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('GPG_SUBKEY_ID') {
      value: "pass:bots/dt.fa3st/gpg/subkey_id",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_PASSWORD') {
      value: "pass:bots/dt.fa3st/central.sonatype.org/token-password",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_USERNAME') {
      value: "pass:bots/dt.fa3st/central.sonatype.org/token-username",
    },
  ],
  _repositories+:: [
    orgs.newRepo('fa3st-parent') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('fa3st-codestyle') {
      aliases: ['fa3st-checkstyle'],
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('fa3st-common') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('fa3st-service') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
      webhooks+: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/fa3st-service/295569/') {
          events+: [
            "create",
            "delete",
            "push",
            "pull_request"
          ],
          secret: "pass:bots/dt.fa3st/readthedocs.org/fa3st-service-webhook-secret",
        },
      ],
    },
    orgs.newRepo('fa3st-registry') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
      webhooks+: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/fa3st-registry/295571/') {
          events+: [
            "create",
            "delete",
            "push",
            "pull_request"
          ],
          secret: "pass:bots/dt.fa3st/readthedocs.org/fa3st-registry-webhook-secret",
        },
      ],
    },
    orgs.newRepo('fa3st-client') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
      webhooks+: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/fa3st-client/295572/') {
          events+: [
            "create",
            "delete",
            "push",
            "pull_request"
          ],
          secret: "pass:bots/dt.fa3st/readthedocs.org/fa3st-client-webhook-secret",
        },
      ],
    },
    orgs.newRepo('fa3st-helm') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: true,
      web_commit_signoff_required: false,
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}