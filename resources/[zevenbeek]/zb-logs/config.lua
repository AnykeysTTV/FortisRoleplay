Config = {}

Config.Webhooks = {
    ["default"] = "https://discord.com/api/webhooks/1026149310729048154/FaSS-G1CDKMlparJ_sIygS4dqKV0qfGZWqAsSGqPQ8pdVKHzLxaF2TMLETu95KXgr199",
    ["playermoney"] = "https://discord.com/api/webhooks/1026149457617764352/XEzwTaRckIAXyjICopUUphmSXp7XwBEUnw3BG8Rts8VpDnAshKcuka6aRZ_-_RnAf5WT",
    ["playerinventory"] = "https://discord.com/api/webhooks/1026149622760091738/VQMoLcwmZj24Z49E0KTnq3NeBVulN5c5SS-6RlwIqVVyuT144cIlaBfHIjYAhsoOAz9r",
--     ["cuffing"] = "https://d/api/webhooks/650361766068355133/E3a-l362SfDmleFDlA9CRHn6tV45ntTMlTdat0Ji61nX0-F3fTnEn1zrVm_F7g9jYSu3",
--     ["drop"] = "https://discord.com/api/webhooks/774299187327926284/aQjOtgl_fdOvblZzvkSzIlw_9P999sWbpmA2JRHkWrfgi_8zjD-ReP0XC8eOo5HJ4K4R",
--     ["trunk"] = "https://discord.com/api/webhooks/774299099343749160/9ZR1ZFm-eSNOlvkBp5fq39mtkOo8mHNpAkLJ9L6HXKlWQy3RzOSChnUDuMPIarSWHgez",
--     ["stash"] = "https://discord.com/api/webhooks/774299041344913428/GPf-QqNok78NaH8be6bipyNCECbuTM-jw9nxV-MKWOJtXhOM_8Tx7MAD6NKEcRsctycI",
--     ["glovebox"] = "https://d/api/webhooks/650361940178370578/lqd_q8A20OP4xYBUi_MAoSa2hMc9MCqpZKZKm7A_gJh2FOYTSbhAP9WvaQCYJX86Lkav",
--     ["banking"] = "https://d/api/webhooks/650361982079467568/bGl9iSSEHazLFw0HgUh1d66UfalKA_vPAtJ9g5z8grZeQnZTfi3IeQ939InD8jmXvNU9",
--     ["vehicleshop"] = "https://discord.com/api/webhooks/787301113429753887/yTHKq3iD-5VIb7Yxow8IqQlfPs8wJ3hpOfZaaxDpuVtOpcfe82iOwL2XfgnpCqSy7ZWi",
--     ["vehicleupgrades"] = "https://discord.com/api/webhooks/774299958744055818/M2TXzt3S7iK1X3ZQFpXem62y0iQnnPJFLB84JOAc_Let-G7TZdFeMoeAkEyWbiwlwr4Q",
--     ["shops"] = "https://discord.com/api/webhooks/774300190043406396/tWbmWy-ZYorU5hNx5jySOVvRSJSlxhKNHOQTbGy5nG7R7gkoV1wQW7bSmiw58vhRPrrc",
--     ["dealers"] = "https://d/api/webhooks/650362216847245322/ZOxKaxJJgXEgPHZpmiNHyudAamrgx5fLdu_1u9eWHISSyumPSmNPr517MHcLxlxVrLTx",
--     ["storerobbery"] = "https://discord.com/api/webhooks/793634699519197205/8c8STbJOMrxzF0ba6mFPW7fyONCYMsetBEptZQiqj29AQywIF_z5lskOtXMzTw43S_Fm",
--     ["bankrobbery"] = "https://discord.com/api/webhooks/793634699519197205/8c8STbJOMrxzF0ba6mFPW7fyONCYMsetBEptZQiqj29AQywIF_z5lskOtXMzTw43S_Fm",
--     ["powerplants"] = "https://discord.com/api/webhooks/774299768766857266/bjGhLJxwrXncvMYxRlymIrHmbK9SPuS_1pmNzhslajrkFL-IRY7IIcS8I3-O2X8fmAFz",
--     ["death"] = "https://discord.com/api/webhooks/793634486658531338/QHdU2xUqXe1_tHYm6xNo95Xusm7g59NoOQx5H0DbfvqrCGqK7u7pEPP7F-6XxQMFlKEb",
     ["joinleave"] = "https://discord.com/api/webhooks/1026150045961166939/RJDRHS7o4L8qL8z7EByOgv8DTUma_OjRdz6Cvm7iZIOWoZ3D_DnCrUFUhjZrjXwTvdSd",
    ["ooc"] = "https://discord.com/api/webhooks/1026150232326676551/nMiR8iV_GeI7VWVDmA8-J1EqneifZPErJLpX4y1VdOzekBktZS3oGhqkclUT43IPOFAi",
    ["report"] = "https://discord.com/api/webhooks/1026150232326676551/nMiR8iV_GeI7VWVDmA8-J1EqneifZPErJLpX4y1VdOzekBktZS3oGhqkclUT43IPOFAi",
    ["me"] = "https://discord.com/api/webhooks/1026150232326676551/nMiR8iV_GeI7VWVDmA8-J1EqneifZPErJLpX4y1VdOzekBktZS3oGhqkclUT43IPOFAi",
--     ["pmelding"] = "https://discord.com/api/webhooks/774298395728150641/g8rNAxfB_ouzd9cmOlouG6qw90ejNVADkmJvqM82S4ZHYqlY6fVC1U4fKEHLWUdtpJMR",
--     ["112"] = "https://discord.com/api/webhooks/774298395728150641/g8rNAxfB_ouzd9cmOlouG6qw90ejNVADkmJvqM82S4ZHYqlY6fVC1U4fKEHLWUdtpJMR",
--     ["admin"] = "https://discord.com/api/webhooks/774298607234842696/zZ5chv03wxG4_i8TuDlOhQgBFzEhUqE717Th5J0zMepzaHeQfT2uqGCPlWwOD6w14COf",
--     ["anticheat"] = "https://discord.com/api/webhooks/772932134293078026/zb5gZde20001BngfDT7YQeJ0EBpPCkX5vJwbu5maIHJZdL1xJnFeHJovoGEZ4ZbL60OM",
--     ["weather"] = "https://discord.com/api/webhooks/786029189638783017/B798K8gIeH5rgaeWwcmVugGnoIgct5b2DMiGo0iOAulfJSZQVlj6keCUN_Jipl6SZjx5",
--     ["moneysafes"] = "https://d/api/webhooks/699387466171285545/TbZPo5bvgACD7dM74yHHAsRdQX42Hd3X9xWsY3BIKF0hhAlNyU6bbBOWxP3zwr8cv9CI",
--     ["bennys"] = "https://discord.com/api/webhooks/774299958744055818/M2TXzt3S7iK1X3ZQFpXem62y0iQnnPJFLB84JOAc_Let-G7TZdFeMoeAkEyWbiwlwr4Q",
--     ["duty"] = "https://discord.com/api/webhooks/785859003762343968/QF7tisengMf6bkUMGKabpVf6AuYoMaImWBgFvquA-CzgH14vYMKVFtn-7YoMZX0yb6Ng",
--     ["idlogs"] = "https://discord.com/api/webhooks/803340630481960973/xajUhUvRGy6EauntCqU3VaYRiyTI3l6tx6jxGuso0WRHAMfkarV4l7zd_HwiYNKzfBlW",
--     ["screenshotlogs"] = "https://discord.com/api/webhooks/803387516849356821/Z9tFQU8s_QhaZNZoN2NkQyB8Dvvz2LT5sNEVYb9GkmrMOcrVo5m4GhjseskK6O2Kuhdj",
--     ["twitterLogs"] = "https://discord.com/api/webhooks/810277688685232198/qlgyvCfrcQTT8bpwIKsqu8NhbpX2mOb4yzcxivHttxhL2WqY-5-z4OEWP--dnGP9b-6M",
--     ["inventoryGeef"] = "https://discord.com/api/webhooks/813122570412621865/6OudeDutliS_I_qVvca1ARi9TesYrwgo9OJ0ig4YFGk9CBzTOD1bl0BvG79W7ar7JMQ4",
--     ["encrochat"] = "https://discord.com/api/webhooks/827863154775031819/SM3sOKucj8jCgUMFs8WOlEApxpxM3OpY_TvUzYk2k4sy1Y6O9FIQiTRmTZv-bYzBJA2Y",
--     ["banLogs"] = "https://discord.com/api/webhooks/856121176874811393/23zDO_gc0f5uW40-cjzgAb929kDuBrFHVTp9TwEVVe8ANd-y_ARPW2oD1zxeiqEI9UXt",
--     ["boomboxLogs"] = "https://discord.com/api/webhooks/910530767392768020/HH8xMc6IKTVsUQ5mixo2mpKNr4a8iHaLiLnbm09Vma5xFVnUKj9YSwdxb8Zeo1muo9TF",
 }

Config.Colors = {
    ["default"] = 16711680,
    ["blue"] = 25087,
    ["green"] = 762640,
    ["white"] = 16777215,
    ["black"] = 0,
    ["orange"] = 16743168,
    ["lightgreen"] = 65309,
    ["yellow"] = 15335168,
    ["turqois"] = 62207,
    ["pink"] = 16711900,
    ["red"] = 16711680,
}