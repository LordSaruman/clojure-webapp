(ns clojure-webapp.domain.bank
  (:refer-clojure :exclude [get])
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.java.jdbc.sql :as sql]))

(def mysql-db {
               :subprotocol "mysql"
               :subname "//localhost:3306/clojure_dbs"
               :user "root"
               :password "root"
               :zeroDateTimeBehaviour "convertToNull"
               })

(def now (str (java.sql.Timestamp. (System/currentTimeMillis))))

(defn allBanks []
  (jdbc/query mysql-db
              ["SELECT * FROM bank b"]))


(defn allEuribor []
  (jdbc/query mysql-db
              ["SELECT * FROM euribor e"]))


(defn get [id]
  (first (jdbc/query mysql-db
                     ["SELECT * FROM bank WHERE id_bank = ?" id])))


(defn removeBank [id]
  (jdbc/execute! mysql-db
                 ["DELETE FROM bank WHERE id_bank = ?" id]))


(defn update [id params]
  (jdbc/update! mysql-db :bank params (sql/where {:id_bank id})))

(defn insertBank
  [params]
  (jdbc/insert! mysql-db :bank params))