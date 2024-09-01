const { replicate, clean, fetchSession } = require("./session");

async function main() {
  try {
    clean();
    await fetchSession();
    await replicate();
    setTimeout(() => {
      require("./bot");
    }, 2000);
  } catch (error) {
    console.error(error?.message);
  }
}
main();