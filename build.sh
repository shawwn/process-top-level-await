set -x
mkdir -p node/lib/internal/repl
mkdir -p node/deps/acorn
rsync -Pa ~/node/lib/internal/repl/await.js ./node/lib/internal/repl/await.js
rsync -Pa ~/node/deps/acorn/ ./node/deps/acorn/
cat ./node/lib/internal/repl/await.js | replace 'internal/' '../../../' | sponge ./node/lib/internal/repl/await.js
echo 'processTopLevelAwait = require("./lib/internal/repl/await.js").processTopLevelAwait; module.exports = processTopLevelAwait;' > node/await.js
browserify node/await.js > bundle.js
