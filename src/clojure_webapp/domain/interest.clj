(ns clojure-webapp.domain.interest
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

(defn allInterests []
  (jdbc/query mysql-db
              ["SELECT * FROM interest i"]))

(defn allTypeInterest []
  (jdbc/query mysql-db
              ["SELECT * FROM typeinterest ti"]))

(defn removeInterest [id]
  (jdbc/execute! mysql-db
                 ["DELETE FROM interest WHERE id_interest = ?" id]))

(defn get [id]
  (first (jdbc/query mysql-db
                     ["SELECT * FROM interest WHERE id_interest = ?" id])))


(defn update [id params]
  (jdbc/update! mysql-db :interest params (sql/where {:id_interest id})))


(defn insertInterest
  [params]
  (jdbc/insert! mysql-db :interest params))