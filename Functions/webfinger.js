const originAccountDomain = "jhona.tn";

const redirections = {
  // Implement your redirections mapping here
  "dev": {
    user: "jhonatn",
    domain: "mastodon.social"
  },
  "me": {
    user: "jhonatn",
    domain: "mastodon.social"
  }
};

exports.handler = async (event) => {
  var accountHandle = "";
  var accountUri = "";
  try {
    const { resource } = event.queryStringParameters || {};

    const _accountHandle = extractAccountHandle(
      resource,
      originAccountDomain
    );
    accountHandle = _accountHandle;
    accountUri = resource;
  } catch (error) {
    return {
      statusCode: 400
    };
  }

  if (!redirections[accountHandle]) {
    return {
      statusCode: 404
    };
  }

  const redirection = redirections[accountHandle];
  const newURL = generateWebFingerRequestURL(
    redirection.domain,
    redirection.user,
    accountUri
  );

  return {
    statusCode: 302,
    headers: {
      Location: newURL,
    },
  };
};

function extractAccountHandle(acct, originAccountDomain) {
  let accountHandle = acct.replace(/^acct:/, '');

  const domainIndex = accountHandle.indexOf('@' + originAccountDomain);
  if (domainIndex !== -1) {
    return accountHandle.substring(0, domainIndex);
  }

  return accountHandle;
}

function generateWebFingerRequestURL(newHost, newUser, originalResource) {
  var newUrl = new URL("https://" + originAccountDomain);
  newUrl.host = newHost;
  newUrl.pathname = '/.well-known/webfinger';
  newUrl.searchParams.set("resource", `acct:${newUser}@${newHost}`);

  return newUrl.toString();
}