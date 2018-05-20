(ns clojure-webapp.webController.controller
  (:require
    [clostache.parser :as clostache]
    [clojure-webapp.domain.bank :as bank-domain]
    [clojure-webapp.domain.interest :as interest-domain]
    ))

(defn read-template [template-name]
  (slurp (clojure.java.io/resource
           (str "pages/" template-name ".mustache"))))

(defn render-template [template-file params]
  (clostache/render (read-template template-file) params))


(defn home []
  (render-template "homepage" {}))

(defn index []
  (render-template "index" {}))

(defn allBanks []
  (render-template "allBanks" {:bank (bank-domain/allBanks)
                               :euribor (bank-domain/allEuribor)}))

(defn banks[]
  (render-template "banks" {:bank (bank-domain/allBanks)
                            :euribor (bank-domain/allEuribor)}))

(defn updatingBank [id]
  (render-template "updateBank" {:bank (bank-domain/get id)
                                 :euribor (bank-domain/allEuribor)}))

(defn updatingInterest [id]
  (render-template "updateInterest" {:interest (interest-domain/get id)
                                     :typeinterest (interest-domain/allTypeInterest)
                                     }))


(defn interests []
  (render-template "interests" {:interest (interest-domain/allInterests)
                                :typeinterest (interest-domain/allTypeInterest)
                                }))