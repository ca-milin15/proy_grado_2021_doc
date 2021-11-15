-- `autenticacion-biometrica`.resource definition

CREATE TABLE `resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `path_resource` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
-- `autenticacion-biometrica`.profile definition

CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `id_resource` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idResource` (`id_resource`),
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_resource`) REFERENCES `resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- `autenticacion-biometrica`.`user` definition

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `identification` varchar(20) NOT NULL,
  `id_profile` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idProfile` (`id_profile`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- `autenticacion-biometrica`.user_info_biometric definition

CREATE TABLE `user_info_biometric` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) NOT NULL,
  `face_id` varchar(120) NOT NULL,
  `external_id` varchar(50) NOT NULL,
  `bucket_name` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUser` (`id_user`),
  CONSTRAINT `user_info_biometric_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;