class Configuration {


    /**
     * 
     * @param {object} config 
     * @param {string} config.apiKey
     */

    constructor(config) {
        this.config = config;
    }

    get() {
        return this.config;
    }

}

module.exports = Configuration;