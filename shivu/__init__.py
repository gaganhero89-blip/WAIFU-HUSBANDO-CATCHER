import logging
import asyncio
from telegram.ext import Application
from motor.motor_asyncio import AsyncIOMotorClient

from shivu.config import Development as Config

# ---------------- LOGGING ---------------- #
logging.basicConfig(
    format="%(asctime)s - %(levelname)s - %(name)s - %(message)s",
    level=logging.INFO,
    handlers=[logging.FileHandler("log.txt"), logging.StreamHandler()],
)

logging.getLogger("httpx").setLevel(logging.WARNING)
logging.getLogger("apscheduler").setLevel(logging.ERROR)

LOGGER = logging.getLogger(__name__)

# ---------------- CONFIG ---------------- #
TOKEN = Config.TOKEN
mongo_url = Config.mongo_url

# ---------------- DATABASE ---------------- #
mongo_client = AsyncIOMotorClient(mongo_url)
db = mongo_client["Character_catcher"]

collection = db["anime_characters_lol"]
user_totals_collection = db["user_totals_lmaoooo"]
user_collection = db["user_collection_lmaoooo"]
group_user_totals_collection = db["group_user_totalsssssss"]
top_global_groups_collection = db["top_global_groups"]
pm_users = db["total_pm_users"]

# ---------------- BOT ---------------- #
application = Application.builder().token(TOKEN).build()

# ---------------- MAIN ---------------- #
async def main():
    LOGGER.info("Starting bot...")

    await application.initialize()
    await application.start()
    await application.updater.start_polling()

    LOGGER.info("Bot started successfully.")

    # keep running forever
    await asyncio.Event().wait()


if __name__ == "__main__":
    asyncio.run(main())
