var Instructors = artifacts.require("./Instructors.sol");

module.exports = function(deployer) {
  deployer.deploy(Instructors);
};
