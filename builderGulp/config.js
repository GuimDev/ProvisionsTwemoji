const defaultBuildFolder = "build";

const addonConfig = {
    modName: "ProvisionsTwemojiSupport",
    buildFolder: defaultBuildFolder,
    archiveFolder: "archive",

    // Set addon directory in environment vars or set default above. Mine is set to "C:\\Users\\Mike\\Documents\\Elder Scrolls Online\\live\\AddOns"
    esoAddonDir: process.env["ESO_ADDONS_PATH"] || defaultBuildFolder,
    sourceFiles: [
        "textures/**",
        "emojiAlias.lua",
        "emojiTable.lua",
        "header.lua",
        "ProvisionsTwemojiSupport.txt",
        "ProvTwemoji.jpg",
        "README.md",
        "TwemojiSupport.lua"
    ],
    filesWithVersionNumber: [
        ["ProvisionsTwemojiSupport.txt", 2],
        ["README.md", 1],
        ["header.lua", 1]
    ]
};

module.exports = addonConfig;

function getFileContent(filename) {
    return fs.readFileSync(filename).toString();
}
