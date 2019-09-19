-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PlayaDeEstacionamiento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PlayaDeEstacionamiento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PlayaDeEstacionamiento` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci ;
USE `PlayaDeEstacionamiento` ;

-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Marca` (
  `idMarca` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Modelo` (
  `idModelo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Marca_idMarca` INT NOT NULL,
  PRIMARY KEY (`idModelo`),
  INDEX `fk_Modelo_Marca1_idx` (`Marca_idMarca` ASC),
  CONSTRAINT `fk_Modelo_Marca1`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `PlayaDeEstacionamiento`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Propietario` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(100) NULL,
  `Apellido` VARCHAR(100) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`TipoVehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`TipoVehiculo` (
  `idTipoVehiculo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoVehiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Vehiculo` (
  `idVehiculo` INT NOT NULL,
  `dominio` INT NULL,
  `Modelo_idModelo` INT NOT NULL,
  `Propietario_DNI` INT NOT NULL,
  `TipoVehiculo_idTipoVehiculo` INT NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  INDEX `fk_Vehiculo_Modelo1_idx` (`Modelo_idModelo` ASC),
  INDEX `fk_Vehiculo_Propietario1_idx` (`Propietario_DNI` ASC),
  INDEX `fk_Vehiculo_TipoVehiculo1_idx` (`TipoVehiculo_idTipoVehiculo` ASC),
  CONSTRAINT `fk_Vehiculo_Modelo1`
    FOREIGN KEY (`Modelo_idModelo`)
    REFERENCES `PlayaDeEstacionamiento`.`Modelo` (`idModelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_Propietario1`
    FOREIGN KEY (`Propietario_DNI`)
    REFERENCES `PlayaDeEstacionamiento`.`Propietario` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehiculo_TipoVehiculo1`
    FOREIGN KEY (`TipoVehiculo_idTipoVehiculo`)
    REFERENCES `PlayaDeEstacionamiento`.`TipoVehiculo` (`idTipoVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Tarifa` (
  `idTarifa` INT NOT NULL,
  `Abonado` TINYINT(1) NULL,
  `IngresoSinSaldo` INT(2) NULL,
  `Precio` DOUBLE NULL,
  `FechaHora` DATETIME NULL,
  `TipoVehiculo_idTipoVehiculo` INT NOT NULL,
  PRIMARY KEY (`idTarifa`),
  INDEX `fk_Tarifa_TipoVehiculo1_idx` (`TipoVehiculo_idTipoVehiculo` ASC),
  CONSTRAINT `fk_Tarifa_TipoVehiculo1`
    FOREIGN KEY (`TipoVehiculo_idTipoVehiculo`)
    REFERENCES `PlayaDeEstacionamiento`.`TipoVehiculo` (`idTipoVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `NombreUsuario` VARCHAR(100) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Apellido` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Abono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Abono` (
  `idAbono` INT NOT NULL,
  `MontoDisponible` DOUBLE NULL,
  `MontoAcreditado` DOUBLE NULL,
  `FechaHora` DATETIME NOT NULL,
  `NroTicket` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Propietario_DNI` INT NOT NULL,
  PRIMARY KEY (`idAbono`),
  INDEX `fk_Abono_Usuario1_idx` (`Usuario_idUsuario` ASC),
  INDEX `fk_Abono_Propietario1_idx` (`Propietario_DNI` ASC),
  CONSTRAINT `fk_Abono_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `PlayaDeEstacionamiento`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Abono_Propietario1`
    FOREIGN KEY (`Propietario_DNI`)
    REFERENCES `PlayaDeEstacionamiento`.`Propietario` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Porton`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Porton` (
  `idPorton` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPorton`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PlayaDeEstacionamiento`.`Ingreso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PlayaDeEstacionamiento`.`Ingreso` (
  `CodIngreso` INT NOT NULL,
  `FechaHoraIngreso` DATETIME NOT NULL,
  `FechaHoraSalida` DATETIME NOT NULL,
  `NroTicket` INT NULL,
  `Monto` DOUBLE NULL,
  `CodBarra` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Abono_idAbono` INT NOT NULL,
  `Porton_idPorton` INT NOT NULL,
  `Tarifa_idTarifa` INT NOT NULL,
  `Vehiculo_idVehiculo` INT NOT NULL,
  PRIMARY KEY (`CodIngreso`),
  INDEX `fk_Ingreso_Usuario1_idx` (`Usuario_idUsuario` ASC),
  INDEX `fk_Ingreso_Abono1_idx` (`Abono_idAbono` ASC),
  INDEX `fk_Ingreso_Porton1_idx` (`Porton_idPorton` ASC),
  INDEX `fk_Ingreso_Tarifa1_idx` (`Tarifa_idTarifa` ASC),
  INDEX `fk_Ingreso_Vehiculo1_idx` (`Vehiculo_idVehiculo` ASC),
  CONSTRAINT `fk_Ingreso_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `PlayaDeEstacionamiento`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingreso_Abono1`
    FOREIGN KEY (`Abono_idAbono`)
    REFERENCES `PlayaDeEstacionamiento`.`Abono` (`idAbono`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingreso_Porton1`
    FOREIGN KEY (`Porton_idPorton`)
    REFERENCES `PlayaDeEstacionamiento`.`Porton` (`idPorton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingreso_Tarifa1`
    FOREIGN KEY (`Tarifa_idTarifa`)
    REFERENCES `PlayaDeEstacionamiento`.`Tarifa` (`idTarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingreso_Vehiculo1`
    FOREIGN KEY (`Vehiculo_idVehiculo`)
    REFERENCES `PlayaDeEstacionamiento`.`Vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
