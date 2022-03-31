<?php

namespace hiqdev\reodb\doctrine2;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;
use Exception;
use PDO;

/**
 * Class FileBasedMigration
 *
 * @author Dmytro Naumenko <d.naumenko.a@gmail.com>
 */
abstract class FileBasedMigration extends AbstractMigration
{
    /**
     * @var string[]
     */
    protected array $importFiles = [];

    /**
     * @return string the dir with files
     */
    abstract public function getFilesDir(): string;

    public function up(Schema $schema): void
    {
        $this->addSql('SELECT true;');

        $dir = $this->getFilesDir();
        if (!file_exists($dir)) {
            throw new \InvalidArgumentException('Wrong directory for file based migration: ' . $dir);
        }
        foreach ($this->importFiles as $filename) {
            $this->applyMigrationFile($dir . '/' . $filename);
        }
    }

    protected function applyMigrationFile($filename)
    {
        $pdoConnection = $this->connection->getNativeConnection();

        $attr_emulate_prepares = $pdoConnection->getAttribute(PDO::ATTR_EMULATE_PREPARES);
        $pdoConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);

        $this->write(
            "\n" . sprintf('  <info>++</info> applying <comment>%s</comment>', $filename) . "\n"
        );

        $pdoConnection->exec(file_get_contents($filename));
        $pdoConnection->setAttribute(PDO::ATTR_EMULATE_PREPARES, $attr_emulate_prepares);
    }

    public function down(Schema $schema): void
    {
        throw new Exception('Down is not supported for file based migration. Sorry!');
    }
}
