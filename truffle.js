module.exports = {
  networks: {
      // See <http://truffleframework.com/docs/advanced/configuration>
      // for more about customizing your Truffle configuration!
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id
    },
    rinkeby: {
      host: "localhost", // Connect to geth on the specified
      port: 8545,
      from: "0xbbafad45e1ae07285bf5627d810065859dc318e8",
      network_id: 4,
      gas: 4612388 // Gas limit used for deploys
    }
  }
};
