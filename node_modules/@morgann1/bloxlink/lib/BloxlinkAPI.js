const { fetch } = require("undici");
const Configuration = require("./Configuration");

class BloxlinkAPI {

    /**
     * 
     * @param {Configuration} config 
     */

    constructor(config) {
        this.config = config;
    }

    /**
     * 
     * @param {string} discordId 
     * @param {string} guildId 
     */

    async search(discordId, guildId = undefined) {
        let url = `https://v3.blox.link/developer/discord/${discordId}${guildId === undefined ? "" : `?guildId=${guildId}`}`;

        if (!this.config) return new Error("configuration was not found");
        let config = this.config.get();

        let apiKey = config.apiKey;
        if (!apiKey) return new Error("api key was not defined");

        const res = await fetch(url, {
            method: "GET",
            headers: {
                "api-key": apiKey
            }
        });

        return await res.json();
    }

}

module.exports = BloxlinkAPI;