(ns clojure-webapp.core
  (:use compojure.core)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]
            [ring.middleware.basic-authentication :refer :all]
            [ring.util.response :as resp]
            [clojure-webapp.webController.controller :as controller]
            [clojure-webapp.domain.bank :as bank-domain]
            [clojure-webapp.domain.interest :as interest-domain]))

(defroutes public-routes
           (GET "/" [] (controller/index))
           (route/resources "/")
           (GET "/index" [] (controller/index))
           (route/resources "/")
           (GET "/banks" [] (controller/banks))
           (route/resources "/")
           (GET "/interests" [] (controller/interests))
           (route/resources "/")
           (GET "/homepage" [] (controller/home))
           (route/resources "/")
           (GET "/allBanks" [] (controller/allBanks))
           (route/resources "/")
           (GET "/allInterests" [] (controller/allInterests))
           (route/resources "/")

           (GET "/domain/banks/:id/remove" [id]
             (do (bank-domain/removeBank id)
                 (resp/redirect "/allBanks")))

           (GET "/domain/interests/:id/remove" [id]
             (do (interest-domain/removeInterest id)
                 (resp/redirect "/allInterests")))

           (POST "/domain/banks/insert" [& params]
             (do (bank-domain/insertBank params)
                 (resp/redirect "/allBanks")))

           (POST "/domain/interests/insert" [& params]
             (do (interest-domain/insertInterest params)
                 (resp/redirect "/allInterests")))

           (GET "/domain/banks/:id/update" [id]
             (controller/updatingBank id))

           (POST "/domain/banks/:id_bank/update" [& params]
             (do (bank-domain/update (:id_bank params) params)
                 (resp/redirect "/allBanks")))

           (GET "/domain/interests/:id/update" [id]
             (controller/updatingInterest id))

           (POST "/domain/interests/:id_interest/update" [& params]
             (do (interest-domain/update (:id_interest params) params)
                 (resp/redirect "/allInterests")))

           )



(defroutes app-routes
           public-routes
           (route/not-found "404. Page not found"))

(def -main
  (handler/site app-routes))